module MsConvertersHelper
  # ignore this
  # @ms_converter = MsConverter.find(params[:id])

  # part and staff variables used in code block that finds and isolates parts
  part_array = []
  staff_array = []
  # variables used for loops.
  i = 0
  j = 0
  k = 0

  sheet_info = Hash.new{|hsh,key| hsh[key] = {}}

  file = # @ms_converter.attachment.read

    # Break sheet into parts
    part_exists = true
    while part_exists do

    if ((file =~ /<Part>/) != nil) && ((file =~ /<\/Part>/) != nil)
      part_index = file =~ /<Part>/
      end_part_index = (file =~ /<\/Part>/) + 7

      sub_file = file.slice!(part_index...end_part_index)
      part_array.push(sub_file)

    elsif ((file =~ /Part/) == nil) || ((file =~ /<\/Part>/) == nil)
      part_exists = false

    end
    end
  # Break parts into staves
  while i < part_array.length do
    staff_exists = true
    while staff_exists do

      if ((part_array[i] =~ /<Staff id=/) != nil) && ((part_array[i] =~ /<\/Staff>/) != nil)

        staff_index = part_array[i] =~ /<Staff id=/
        end_staff_index = (part_array[i] =~ /<\/Staff>/) + 8

        sub_file = part_array[i].slice!(staff_index...end_staff_index)
        staff_array.push(sub_file)

      elsif ((part_array[i] =~ /<Staff id=/) == nil) || ((part_array[i] =~ /<\/Staff>/) == nil)

        staff_exists = false
      end
     end
     # Gather information from staves
     j = 0
     while j < staff_array.length do

       staff_string = staff_array[j]
       # sheet_info # part => {staff => staffID}
       sheet_info[i].store(j, staff_string[11])
       j += 1
     end
     # Put staves back into part before moving on to next part
     k = 0
     while k < staff_array.length do

       k += 1
       if k > 1

         staff_array[(staff_array.length - k)].concat(" ")
       end
       part_array[i].insert(7, staff_array[(staff_array.length - k)])
     end
     staff_array.clear
     i += 1
  end
end
