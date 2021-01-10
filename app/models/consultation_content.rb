class ConsultationContent < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ここから選択' },
    { id: 2, name: '検査' },
    { id: 3, name: '治療' },
    { id: 4, name: '症状' }
  ]
end
