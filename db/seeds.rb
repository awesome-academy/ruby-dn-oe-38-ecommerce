Brand.create!(name: "samsung")
Brand.create!(name: "LG")

Size.create!(name: 30)

Product.create!(name: "Abc",
  price: 3000000,
  describe: "Ti vi chất lượng",
  brand_id: 1,
  size_id: 1)
