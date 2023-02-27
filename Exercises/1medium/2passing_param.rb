def categories(array)
  yield(array)
end

categories(%w(raven finch hawk eagle)) do |_, _, *raptors|
  p raptors
end