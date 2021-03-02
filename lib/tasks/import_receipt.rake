task import_receipt: :environment do
	files = Dir.glob("#{Rails.root}/public/receipt_parser_images/2020-11-10/**/*")

	puts "Importing..."

	ActiveRecord::Base.transaction do
		# Clean up all data before importing
		ActiveRecord::Base.connection.truncate(:receipts)

		files.each do |file|
			receipt = Receipt.new
			receipt.image.attach(io: File.open(file), filename: file&.split('/')&.last)
			receipt.save
		end
	end

	puts "Imported successfully"
end