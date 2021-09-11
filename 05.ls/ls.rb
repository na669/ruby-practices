# frozen_string_literal: true

class Lscommand
  files = Dir.glob('*')
  files = files.sort

  column = 3

  max_character = 0
  files.each do |f|
    max_character = f.length if max_character <= f.length
  end

  original_files = Marshal.load(Marshal.dump(files))
  r = files.size % column
  r_min = 1
  r_max = column - 1

  (r_min..r_max).each do |m|
    next unless r == m

    (column - r).times do
      files << nil
    end
  end

  row = (original_files.size.to_f / column).ceil
  files_sliced = files.each_slice(row).to_a
  files_transed = files_sliced.transpose

  files_transed.each do |f|
    f.each do |g|
      printf("%-#{max_character + 2}s", g)
    end
    print("\n")
  end
end
