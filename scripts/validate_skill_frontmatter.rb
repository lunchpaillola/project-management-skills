#!/usr/bin/env ruby

require "psych"

ROOT = File.expand_path("..", __dir__)
SKILL_GLOB = File.join(ROOT, "skills", "*", "SKILL.md")

def extract_frontmatter(content)
  lines = content.lines
  return [nil, nil] unless lines.first&.strip == "---"

  closing_index = nil
  lines.each_with_index do |line, idx|
    next if idx.zero?
    if line.strip == "---"
      closing_index = idx
      break
    end
  end

  return [nil, nil] if closing_index.nil?

  frontmatter_lines = lines[1...closing_index]
  [frontmatter_lines.join, closing_index + 1]
end

files = Dir.glob(SKILL_GLOB).sort

if files.empty?
  puts "No SKILL.md files found under skills/."
  exit 1
end

errors = []

files.each do |path|
  content = File.read(path)
  frontmatter, _closing_line = extract_frontmatter(content)

  if frontmatter.nil?
    errors << "#{path}: missing or malformed YAML frontmatter delimiters"
    next
  end

  begin
    data = Psych.safe_load(frontmatter, permitted_classes: [], aliases: false)
    unless data.is_a?(Hash)
      errors << "#{path}: frontmatter must parse to a mapping"
      next
    end

    %w[name description].each do |required_key|
      if !data.key?(required_key) || data[required_key].to_s.strip.empty?
        errors << "#{path}: missing required frontmatter key '#{required_key}'"
      end
    end

    metadata = data["metadata"]
    if metadata && !metadata.is_a?(Hash)
      errors << "#{path}: metadata must be a mapping when present"
    end
  rescue Psych::SyntaxError => e
    line = e.line ? e.line + 1 : "unknown"
    errors << "#{path}: YAML syntax error at frontmatter line #{line}: #{e.problem}"
  end
end

if errors.any?
  puts "SKILL.md frontmatter validation failed:\n\n"
  errors.each { |err| puts "- #{err}" }
  exit 1
end

puts "Validated #{files.length} SKILL.md file(s): YAML frontmatter is valid."
