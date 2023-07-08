address 0x1 {
module WalletScripts {

    use 0x1::Wallet;
    use 0x1::DiemAccount;

    public(script) fun set_wallet_type(sender: signer, type_of: u8) {
      if (type_of == 0) {
        DiemAccount::set_slow(&sender);
      };

      if (type_of == 1) {
          Wallet::set_comm(&sender);
      };
    }

    public(script) fun veto_transaction(sender: signer, uid: u64) {
        Wallet::veto(&sender, uid);
    }
}
}