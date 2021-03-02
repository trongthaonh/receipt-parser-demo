class GoogleVisionService
	require "google/cloud/vision"
	ENV["VISION_CREDENTIALS"] = "/home/trongthaonh/workspace/receipt-parser-demo/config/google-vision-service-account.json"
	DATE_REGEX = /(\d{4}[\年|\/](1[0-2]|[0\ ]?[1-9]){1}[\月|\/](3[01]|[12][0-9]|[0\ ]?[1-9]){1}[\日]?(.*[月火水木金土日][\ \)]*){1}((2[0-3]|1[0-9]|[0\ ]?[1-9]){1}\:([0-5]?[0-9]){1})?)/
	PHONE_REGEX = /(?!8)([0-9][- ]*){10}/

	def initialize
		@image_annotator = Google::Cloud::Vision.image_annotator
	end

	def call(receipt)
		unless receipt.raw_content
			image_path = ActiveStorage::Blob.service.path_for(receipt.image.key)
			response = @image_annotator.text_detection(
				image: image_path,
				max_results: 1
			)

			raw_content = response&.responses&.try(:[], 0)&.text_annotations&.try(:[], 0)&.description
			receipt.raw_content = raw_content
		end

		receipt.purchase_date = extract_date(receipt.raw_content)
		receipt.phone_number = extract_phone(receipt.raw_content)

		receipt.save
	end

	def extract_date(source)
		extracted = source.match(DATE_REGEX)
		extracted&.try(:[], 0)
	end

	def extract_phone(source)
		source.match(PHONE_REGEX)&.try(:[], 0)
	end
end