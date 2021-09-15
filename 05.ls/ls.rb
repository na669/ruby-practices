# frozen_string_literal: true

class Lscommand
  files = Dir.glob('*')
  files = files.sort

  column = 3

  max_character = files.max_by(&:length)

  original_files_size = files.size

  r = files.size % column
  unless r.zero?
    (column - r).times do
      files << nil
    end
  end

  row = (original_files_size.to_f / column).ceil
  files_sliced = files.each_slice(row).to_a
  files_transed = files_sliced.transpose

  files_transed.each do |f|
    f.each do |g|
      printf("%-#{max_character.size + 2}s", g)
    end
    print("\n")
  end
end
