module EdgetteEnumerable

  # all?[{ |obj| block }] → true or false

  def all?(*args)

    all_are_true = true

    if block_given?
      each do |element|
        if yield(element) == false || yield(element).nil?
          all_are_true = false;
        end
      end
    else
      each do |element|
        if element == false || element.nil?
          all_are_true = false;
        end
      end
    end

    all_are_true
  end

  # any?[{ |obj| block }] → true or false

  def any?(*args)

    one_is_true = false

    if block_given?
      each do |element|
        if !(yield(element) == false) && !yield(element).nil?
          one_is_true = true;
        end
      end
    else
      each do |element|
        if !(element == false) || !element.nil?
          one_is_true = true;
        end
      end
    end

    one_is_true
  end

  # chunk { |elt| ... } → array
  # chunk_while { |elt_before,elt_after| bool } → array
  # collect { |obj| block } → array % same as map

  def collect(*args)

    array = []

    each do |element|
      array << yield(element)
    end

    array

  end


  # collect_concat { |obj| block } → array % same as flat_map

  def collect_concat(*args)

    array = []

    each do |element|
      array << yield(element)
    end

    array
  end


  # count → int
  # count(item) → int
  # count { |obj| block } → int

  def count(*args)
    size = 0

    if block_given?
      size = 0
      each do |element|
        if yield(element)
          size += 1
        end
      end
    elsif args.size == 0
      size = 0
      each do |element|
        size += 1
      end
    elsif args.size == 1
        size = 0
        each do |element|
          if element.eql? args[0]
            size += 1
          end
        end
    end

    size
  end




  # cycle(n=nil) { |obj| block } → nil

  def cycle(n=nil)

   for i in 1..n
      each do |element|
        yield(element)
      end
   end
    nil
  end

  # detect(ifnone = nil) { |obj| block } → obj or nil

  def detect(ifnone = nil)

    first_true = nil

    each do |element|
      if yield(element)
        first_true = element
        break
      end
    end

    first_true

  end


  # drop(n) → array

  def drop(*args)

    index = -1

    array = []

    each do |element|
      index += 1
      if index >= args[0]
        array << element
      end
    end
    array
  end


  # drop_while { |arr| block } → array

  def drop_while(*args)


    array = []

    each do |element|

      if !yield(element)
        array << element
      end
    end
    array
  end

  # each_cons(n) { ... } → nil




  # each_entry{ |obj| block } → enum

  def each_entry

    each do |object|
      yield(object)
    end

    return self
  end



  # each_slice(n) { ... } → nil

  def each_slice(n)

    bucket = []

    length = self.count

    self.each_with_index do |obj, i|



      if i%n != n-1
        bucket << obj
      else
        bucket << obj

        yield(bucket)

        bucket=[]

      end

      if i+1 == count && !bucket.empty?
        yield(bucket)
      end

    end

    return nil
  end




  # each_with_index(*args) { |obj, i| block } → enum

  def each_with_index(*args)
    index = 0

    each do |item|
      yield(item, index)
      index += 1
    end

    return self
  end


  # each_with_object(obj) { |(*args), memo_obj| ... } → obj

  def each_with_object(obj)

    each do |item|
      yield(item, obj)
    end

    return obj
  end



  # entries(*args) → array

  def entries(*args)
    result = to_a()
    result
  end

  # find(ifnone = nil) { |obj| block } → obj or nil

  def find(*args)

    foundElement = nil

    if block_given?

      each do |element|
        if yield(element)
          foundElement = element
          break
        end
      end

    end

    foundElement

  end

  # find_all { |obj| block } → array % same as select

  def find_all(*args)

    array = []

    if block_given?

      each do |element|
        if yield(element)
          array << element
        end
      end

    end

    array

  end


  # find_index(value) → int or nil
  # find_index { |obj| block } → int or nil

  def find_index(*args)

    found_index = nil

    index = -1

    if block_given?

      each do |element|
        index += 1
        if yield(element)
          found_index = index
          break
        end
      end

    else
      each do |element|
        index += 1
        if element.eql? args[0]
          found_index = index
        end
      end
    end
    found_index
  end



  # first → obj or nil
  # first(n) → an_array

  def first(*args)
    found = nil
    if args.size == 0

      each do |element|
        found = element
        break
      end
    else

      found = []
      index = -1;

      each do |element|
        index += 1
        if index < args[0]
          found << element
        end
      end
    end


    found
  end


  # flat_map { |obj| block } → array %same as collect_concat

  def flat_map(*args)

    array = []

    each do |element|
      array << yield(element)
    end

    array
  end

  # grep(pattern) → array
  # grep(pattern) { |obj| block} → array

  def grep(*args)

    array = []

    if block_given?

      each do |element|
        if args[0] === element
          array << yield(element)
        end
      end

    else
      each do |element|
        if args[0] === element
          array << element
        end
      end
    end
    array
  end

  # grep_v(pattern) → array
  # grep_v(pattern) { |obj| block } → array

  def grep_v(*args)

    array = []

    if block_given?

      each do |element|
        if !(args[0] === element)
          array << yield(element)
        end
      end

    else
      each do |element|
        if !(args[0] === element)
          array << element
        end
      end
    end
    array
  end


  # group_by { |obj| block } → a_hash

  def group_by

    hash = Hash.new

    each do |element|

      key = yield(element)

      if hash.has_key? key
        array = hash.fetch key
        hash.delete key
        array << element
        hash[key] = array
      else
        hash[key] = [element]
      end

    end

    hash
  end

  # include?(obj) → true or false %same as member

  def include?(obj)

    include = false

    each do |element|
      if obj == element
        include = true
        break
      end
    end
    include
  end

  # inject(initial, sym) → obj %same as reduce (all of inject)
  # inject(sym) → obj
  # inject(initial) { |memo, obj| block } → obj
  # inject { |memo, obj| block } → obj



  # map { |obj| block } → array % same as collect

  def map(*args)

    array = []

    each do |element|
      array << yield(element)
    end

    array

  end

  # max → obj
  # max { |a, b| block } → obj
  # max(n) → array
  # max(n) {|a,b| block } → array

  def max(*args)

    max = first()

    if block_given?

      if args.size == 2

        array = to_a().sort()

        max = array.first(args[0])

      else
        each do |a, b|
          if yield(a, b)
            max = a
          end
        end


      end


    else

      if args.size == 0
        each do |element|
          if max < element
            max = element
          end
        end
      else

        array = to_a().sort.reverse

        max = array.first(args[0])

      end


    end


    max
  end



  # max_by {|obj| block } → obj
  # max_by(n) {|obj| block } → obj

  # member?(obj) → true or false %same as include
  def member?(obj)

    include = false

    each do |element|
      if obj == element
        include = true
        break
      end
    end
    include
  end


  # min → obj
  # min {| a,b | block } → obj
  # min(n) → array
  # min(n) {| a,b | block } → array

  # min_by {|obj| block } → obj
  # min_by(n) {|obj| block } → array

  # minmax → [min, max]
  # minmax { |a, b| block } → [min, max]
  # minmax_by { |obj| block } → [min, max]

  # none? { |obj| block } → true or false

  def none?

    none_are_true = true

    if block_given?
      each do |element|
        if yield(element)
          none_are_true = false
          break
        end
      end
    else
      each do |element|
        if element
          none_are_true = false
          break
        end
      end
    end

    none_are_true
  end

  # one? { |obj| block } → true or false

  def one?

    num_true = 0
    one = false

    if block_given?

      each do |element|
        if yield(element)
          num_true += 1
        end
      end

    else

      each do |element|
        if element
          num_true += 1
        end
      end

    end

    if num_true == 1
      one = true
    end

    one
  end


  # partition { |obj| block } → [ true_array, false_array ]

  def partition

    array_true = []
    array_false = []

    each do |element|

      if yield(element)
        array_true << element
      else
        array_false << element
      end


    end

    result = [array_true, array_false]

    result
  end

  # reduce %see inject above

  def reduce(accumulator = nil)
    if accumulator.nil?
      ignore_first = true
      accumulator = first
    end
    is_first = true
    each do |element|
      unless is_first && ignore_first
        accumulator = yield(accumulator, element)
      end
      is_first = false
    end
    accumulator
  end

  # reject { |obj| block } → array

  def reject
    array_false = []

    each do |element|

      if !yield(element)
        array_false << element
      end
    end

    array_false
  end


  # reverse_each(*args) { |item| block } → enum


  # select { |obj| block } → array % same as find_all

  def select(*args)

    array = []

    if block_given?

      each do |element|
        if yield(element)
          array << element
        end
      end

    end

    array

  end


  # slice_after(pattern) → array
  # slice_after { |elt| bool } → array

  def slice_after(pattern)

    result = []

    if block_given?

      temp = []

      each do |element|
        print element
        if yield(element)
          temp << element
          result << temp
          print result
          temp = []
        else
          temp << element
        end
      end
      result << temp
    else

      temp = []

      each do |element|
        print "Considering element: "+ element.to_s + "\n"
        if element === pattern
          temp << element
          result << temp
          print "Current result: " + result.to_s
          temp = []
        else
          temp << element
        end
      end
      result << temp
    end


    result
  end

  # slice_before(pattern) → array
  # slice_before { |elt| bool } → array

  def slice_before(pattern)

    result = []

    if block_given?

      temp = []

      each do |element|
        if yield(element)
          result << temp
          temp = []
          temp << element
        else
          temp << element
        end
      end
      result << temp
    else

      temp = []

      each do |element|
        if element === pattern

          result << temp
          temp = []
          temp << element
        else
          temp << element
        end
      end
      result << temp
    end


    result
  end


  # slice_when { |elt_before, elt_after| bool } → array

  # def slice_when
  #
  #   result = []
  #
  #   temp = []
  #
  #   each do |a, b|
  #     if yield(a, b)
  #       temp << a
  #       result << temp
  #       temp = []
  #       temp << b
  #     else
  #       temp << a
  #       temp << b
  #     end
  #   end
  #   result << temp
  #
  #   result
  # end

  # sort { |a, b| block } → array

  def sort(&block)

    array = to_a().sort_by(&block)

    array
  end


  # sort_by { |obj| block } → array



  # sum(init=0) → number
  # sum(init=0) { |e| expr } → number

  def sum(init=0, &block)

    sum = init

    if block_given?

      each do |element|
        sum += block.call(element)
      end

    else

      each do |element|
        sum += element
      end

    end

    sum

  end

  # take(n) → array

  def take(n)

    index = -1
    array = []

    each do |element|
      index += 1

      if index < n
        array << element
      end

    end
    array
  end

  # take_while { |obj| block } → array
  def take_while

    array = []

    each do |element|

      if yield(element)
        array << element
      end

    end
    array
  end


  # to_a(*args) → array

  def to_a(*args)

    array = []

    each do |element|
      array << element
    end
  return array
  end

  # to_h(*args) → hash

  # uniq → new_ary
  # uniq → { |item| ... } → new_ary

  def uniq

    array = []


    each do |element|
      if !array.include?(element)
        array << element
      end
    end



    array
  end

  # zip(arg, ...) → an_array_of_array
  # zip(arg, ...) → { |arr| block } → nil



end