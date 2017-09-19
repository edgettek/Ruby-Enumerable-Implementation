module EdgetteEnumerable

  # all?[{ |obj| block }] → true or false

  def all?(*args)

    allAreTrue = true;

    if block_given?
      each do |element|
        if yield(element) == false || yield(element).nil?
          allAreTrue = false;
        end
      end
    else
      each do |element|
        if element == false || element.nil?
          allAreTrue = false;
        end
      end
    end

    allAreTrue
  end

  # any?[{ |obj| block }] → true or false

  def any?(*args)

    oneIsTrue = false;

    if block_given?
      each do |element|
        if !(yield(element) == false) && !yield(element).nil?
          oneIsTrue = true;
        end
      end
    else
      each do |element|
        if !(element == false) || !element.nil?
          oneIsTrue = true;
        end
      end
    end

    oneIsTrue
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

  # detect(ifnone = nil) { |obj| block } → obj or nil


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
  # each_slice(n) { ... } → nil
  # each_with_index(*args) { |obj, i| block } → enum
  # each_with_object(obj) { |(*args), memo_obj| ... } → obj


  # entries(*args) → array

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

  def first

    found = nil

    each do |element|
      found = element
      break
    end

    found
  end

  # first(n) → an_array
  # flat_map { |obj| block } → array %same as collect_concat
  # grep(pattern) → array
  # grep(pattern) { |obj| block} → array
  # grep_v(pattern) → array
  # grep_v(pattern) { |obj| block } → array
  # group_by { |obj| block } → a_hash
  # include?(obj) → true or false %same as member
  # inject(initial, sym) → obj %same as reduce (all of inject)
  # inject(sym) → obj
  # inject(initial) { |memo, obj| block } → obj
  # inject { |memo, obj| block } → obj
  # map { |obj| block } → array % same as collect
  # max → obj
  # max { |a, b| block } → obj
  # max(n) → array
  # max(n) {|a,b| block } → obj
  # max_by {|obj| block } → obj
  # max_by(n) {|obj| block } → obj
  # member?(obj) → true or false %same as include
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
  # one? { |obj| block } → true or false
  # partition { |obj| block } → [ true_array, false_array ]
  # reduce %see inject above
  # reject { |obj| block } → array
  # reverse_each(*args) { |item| block } → enum
  # select { |obj| block } → array % same as find_all
  # slice_after(pattern) → array
  # slice_after { |elt| bool } → array
  # slice_before(pattern) → array
  # slice_before { |elt| bool } → array
  # slice_when { |elt_before, elt_after| bool } → array
  # sort { |a, b| block } → array
  # sort_by { |obj| block } → array
  # sum(init=0) → number
  # sum(init=0) { |e| expr } → number
  # take(n) → array
  # take_while { |obj| block } → array
  # to_a(*args) → array
  # to_h(*args) → hash
  # uniq → new_ary
  # uniq → { |item| ... } → new_ary
  # zip(arg, ...) → an_array_of_array
  # zip(arg, ...) → { |arr| block } → nil



end