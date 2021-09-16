[
  {name: 'PIA	Payment In Advance', description: "You're letting your client know you expect them to pay the total amount due for a project upfront, before you begin work."},
  {name: 'CIA	Cash In Advance', description: "You're specifying both when you expect payment, i.e. before work begins, and you're specifying how the client can pay you, i.e. in cash."},
  {name: 'Upon Receipt', description: "This means you expect payment immediately when the client receives your invoice."},
  {name: 'Net 7', description: "Payment is due seven days from the invoice date."},
  {name: 'Net 21', description: "Payment is due 21 days from the invoice date."},
  {name: 'Net 30', description: "Payment is due 30 days from the invoice date. This is one of the most common payment terms for small businesses and freelancers."},
  {name: 'EOM', description: "Payment is due at the end of the month in which the invoice is received."},
  {name: '15 MFI', description: "Payment is due on the 15th of the month following the invoice date. MFI stands for Month Following Invoice."},
  {name: '2/10 Net 30', description: "This is a variation of Net 30 that offers a discount for early payment. This payment term means payment is due within 30 days of the invoice date, but you offer a 2 percent discount off the invoice amount as a reward for paying within 10 days."},
  {name: '50 Percent Upfront', description: "The client must pay 50 percent of the total invoice amount before work begins on the project. This is common for big projects that take several months to complete."}
].each { |pt| PaymentTerm.create(pt) }


1.upto(10) do |i|
  inv = Invoice.new(
    description: Faker::Hipster.sentence(word_count: 4),
    payment_date: Date.today + 30.days,
    payment_term: PaymentTerm.all.sample,
    client_name: Faker::Company.name,
    client_email: Faker::Internet.email(domain: 'example')
  )

  1.upto([1, 2, 3].sample).each do
    inv.line_items << LineItem.new(name: Faker::Marketing.buzzwords, quantity: [1, 2, 3].sample, price: [100,200,300,400].sample)
  end

  inv.sender_address = SenderAddress.new(
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    post_code: Faker::Address.postcode,
    country: Faker::Address.country
  )

  inv.client_address = ClientAddress.new(
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    post_code: Faker::Address.postcode,
    country: Faker::Address.country
  )

  inv.save!
end