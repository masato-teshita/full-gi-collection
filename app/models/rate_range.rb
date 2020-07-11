class RateRange < ActiveHash::Base
  self.data = [
      {id: 1, name: '★1.0以上', min: 1},
      {id: 2, name: '★2.0以上', min: 2},
      {id: 3, name: '★3.0以上', min: 3},
      {id: 4, name: '★4.0以上', min: 4},
  ]
end