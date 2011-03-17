Factory.define :interval do |i|
  i.sequence( :position ){ |n| n }
  i.length 1
end

Factory.define :scale do |s|
  s.name "chromatic"
  s.intervals { |i| arr = []; 12.times{ |n| arr << i.association(:interval, :position => n) }; arr }
end
