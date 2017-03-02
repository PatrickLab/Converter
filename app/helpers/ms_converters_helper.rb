module MsConvertersHelper
  # ignore this
  # @ms_converter = MsConverter.find(params[:id])


  part_exists = true
  part_amount = 0
  part_array = []

  file = # @ms_converter.attachment.read

    while part_exists

    if (!(file =~ /Part/) == nil) && (!(file =~ /<\/Part>/) == nil)
      part_index = file =~ /Part/
      end_part_index = (file =~ /<\/Part>/) + 7

      sub_file = file.slice!(part_index...end_part_index)
      part_amount += 1
      part_array.push(subFile)

    elsif ((file =~ /Part/) == nil) || ((file =~ /<\/Part>/) == nil)
      part_exists = false

    end

  end
end
