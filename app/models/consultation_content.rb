class ConsultationContent < ActiveHash::Base
  self.data = [
    { id: 1, name: '--ここから選択--' },
    { id: 2, name: 'な し' },
    { id: 3, name: '検 査' },
    { id: 4, name: '治 療' },
    { id: 5, name: '症 状' },
    { id: 6, name: 'その他' }
  ]
end
