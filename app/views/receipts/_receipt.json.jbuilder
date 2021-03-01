json.extract! receipt, :id, :image, :purchase_date, :phone_number, :purchase_date_is_correct, :phone_number_is_correct, :raw_content, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
