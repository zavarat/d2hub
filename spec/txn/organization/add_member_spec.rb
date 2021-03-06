require_relative '../spec_helper'
require_relative '../../../lib/d2hub/txn/organization'
require_relative '../../../lib/d2hub/txn/user'

module D2HUB
  describe AddMemberToOrganization do
    subject { AddMemberToOrganization }

    let(:params) do
      {
          org_name: 'test_org',
          user_name: 'test_user',
          member_name: 'member_name'
      }
    end

    before do
      CreateUser.run user_name: params[:user_name]
      CreateUser.run user_name: params[:member_name]
      CreateOrganization.run user_name: params[:user_name],
                             org_name: params[:org_name]
    end

    it 'should add member to organization' do
      AddMemberToOrganization.run org_name: params[:org_name],
                                  user_name: params[:member_name]
    end
  end
end