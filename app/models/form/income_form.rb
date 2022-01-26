class Form::IncomeForm < Form::Base
  #クラス外部からインスタンス変数income_valuesにアクセス（参照と変更）が可能
  attr_accessor :income_values

  #initializeメソッド、クラスがnewメソッドでインスタンスを作成した時に実行されるメソッド。主にclassのデータの初期化処理を行う。
  def initialize(attributes = {})
    super attributes
      incomes = income.order(created_at: :asc)
      self.income_values = incomes.map { |income| IncomeValue.new(income_id: income.id) } unless income_values.present?
  end

  # 上でsuper attributesとしているので必要
  def income_values_attributes=(attributes)
    self.income_values = attributes.map do |_, income_value_attributes|
      Form::IncomeValue.new(income_values_attributes).tap {|v| puts v }
    end
  end

  def valid?
		valid_income_values = self.income_values.map(&:valid?).all?
		super && valid_income_values
	end

  def save
    return false unless valid?
    IncomeValue.transaction {
      self.inocme_values.select.each { |income_value|
        #多分ここでinitializeが呼び出されてるかも、attr_accessor :income_values によってクラス外（IncomeForm外）でも利用できている？
        #newメソッドに渡した引数がinitializeメソッドの引数として渡される...はず
        a1 = IncomeValue.new(:income_id => income_value.income_id,
          :year_month => income_value.year_manth,
          :value => income_value.value,
          :description => income_value.description)
        a1.save!
      }
    }
    true
  end

  def target_income_values
    self.income_values.select { |v| '*' }
  end

end