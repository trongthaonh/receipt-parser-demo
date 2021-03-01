class Receipt < ApplicationRecord
	include Rails.application.routes.url_helpers

	has_one_attached :image do |attachable|
		attachable.variant :thumb, resize: "100x100"
	end

	# after_save_commit :detect_text

	private

	def detect_text
		gv = GoogleVisionService.new
		gv.call(image)
	end
end
