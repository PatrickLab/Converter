module MsConvertersHelper

  #ignore this
  #@converter_ms = MsConverter.find(params[:id])

  partExists = true
  partAmount = 0
  partArray = []

  file = #@converter_ms.attachment.read

  while partExists

    if ((file =~ /Part/) != nil) && ((file =~ /<\/Part>/) != nil)
      partIndex = file =~ /Part/
      endPartIndex = (file =~ /<\/Part>/) + 7

      subFile = file.slice!(partIndex...endPartIndex)
      partAmount += 1
      partArray.push(subFile)

    elsif ((file =~ /Part/) == nil) || ((file =~ /<\/Part>/) == nil)
      partExists = false

    end

  end
end
