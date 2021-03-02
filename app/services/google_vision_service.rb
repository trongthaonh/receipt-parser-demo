class GoogleVisionService
	require "google/cloud/vision"
	ENV["VISION_CREDENTIALS"] = "/home/trongthaonh/workspace/receipt-parser-demo/config/google-vision-service-account.json"

	def initialize
		@image_annotator = Google::Cloud::Vision.image_annotator
	end

	def call(receipt)
		image_path = ActiveStorage::Blob.service.path_for(receipt.image.key)
		response = @image_annotator.text_detection(
			image: image_path,
			max_results: 1
		)

		raw_content = response&.responses&.try(:[], 0)&.text_annotations&.try(:[], 0)&.description
		receipt.raw_content = raw_content
		receipt.purchase_date = extract_date(raw_content)
		receipt.phone_number = extract_phone(raw_content)

		receipt.save
	end

	def extract_date(source)
		extracted = source.match(/(\d{4}\/\d{2}\/\d{2})/) || source.match(/(\d{4}\年\d{2}\月\d{2}\日)/)
		extracted&.try(:[], 0)
	end

	def extract_phone(source)
		source.match(/^[0-9-]{6,9}$|^[0-9-]{12}$/)&.try(:[], 0)
	end
end