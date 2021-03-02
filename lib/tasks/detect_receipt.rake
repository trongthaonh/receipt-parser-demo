task detect_receipt: :environment do
	gv = GoogleVisionService.new

	puts "Processing..."
	ActiveRecord::Base.transaction do
		Receipt.all.each do |receipt|
			gv.call(receipt)
		end
	end
	puts "Finished"
end