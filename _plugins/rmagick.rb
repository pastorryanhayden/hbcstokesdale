require "rmagick"

Jekyll::Hooks.register :pages, :post_render do |p|
	# IF there is a gallery
	if p.data["gallery"]
		# For every item in the gallery
		p.data["gallery"].each do |img|
			# set the variable infile to be the gallery image minus any initial slash
			infile = img['gallery_image'].sub(/^\//,"")
			# create an outfile that substitues the . for _thumb.
			outfile = infile.sub(/(\.\w+)$/, "_thumb\\1")
			# take the infile (first because some images like gifs actually contain multiple files) copy it as a 250,250 thumbnail and write it using the outfile name
			img = Magick::Image.read(infile).first
			thumb = img.resize_to_fill(250,250)
			thumb.write(outfile)
		end
	end
end
