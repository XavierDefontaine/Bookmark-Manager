require 'database_connection'

describe DatabaseConnection do
  describe '#setup' do
    it 'Connects to a database' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end
  end
  describe '#connection' do
    it 'Checks for persistent connection' do
      connection = DatabaseConnection.setup('bookmark_manager_test')

      expect(DatabaseConnection.connect).to eq connection
    end
  end
end