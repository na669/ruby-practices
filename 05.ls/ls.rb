# frozen_string_literal: true

require 'optparse'

option = {}
OptionParser.new do |opt|
  opt.on('-a', 'all hidden files') { |v| option[:a] = v }
  opt.parse!(ARGV)
end

files = if option[:a]
          Dir.glob('*', File::FNM_DOTMATCH)
        else
          Dir.glob('*')
        end

files = files.sort

COLUMN = 3

max_character = files.max_by(&:length)

original_files_size = files.size

r = files.size % COLUMN
unless r.zero?
  (COLUMN - r).times do
    files << nil
  end
end

row = (original_files_size.to_f / COLUMN).ceil
files_sliced = files.each_slice(row).to_a
files_transed = files_sliced.transpose

files_transed.each do |f|
  f.each do |g|
    printf("%-#{max_character.size + 2}s", g)
  end
  print("\n")
end
