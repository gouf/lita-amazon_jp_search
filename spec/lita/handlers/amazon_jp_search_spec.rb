require "spec_helper"

describe Lita::Handlers::AmazonJpSearch, lita_handler: true do
  it { is_expected.to route('amazon ruby') }
  it { is_expected.to_not route('amazon') }
  it { is_expected.to route('amazon ruby').to(:search_amazon) }

  it 'reply 3 list' do
    send_command('amazon ruby')
    expect(replies.size).to eq 3
  end
end
