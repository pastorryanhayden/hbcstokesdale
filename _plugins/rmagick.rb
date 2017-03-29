require "rmagick"

Jekyll::Hooks.register :pages, :post_render do |p|
	# IF there is a gallery
	if p.data["gallery"]
		# For every item in the gallery
		p.data["gallery"].each do |img|
			infile = img['gallery_image'].sub(/^\//,"")
			outfile = infile.sub(/(\.\w+)$/, "_thumb\\1")
			Magick::Image.read(infile).first.resize_to_fill(250,250).write(outfile)
		end
	end
end
