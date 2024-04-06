from Crypto import Random
from Crypto.Cipher import PKCS1_v1_5
from Crypto.Hash import SHA1
from Crypto.PublicKey import RSA
from Crypto.Signature import PKCS1_v1_5
import binascii
import datetime
import collections
from collections import OrderedDict

# key will be generate on client
class Client:
    def __init__(self) -> None:
        random = Random.new().read # for different hash
        # private key - used for record keeping
        self._private_key = RSA.generate(1024, random) # always 1024
        # public key - client identity
        self._public_key = self._private_key.publickey()
        self._signer = PKCS1_v1_5.new(self._private_key)

    @property
    def identity(self):
         return binascii.hexlify(self._public_key.exportKey("DER")).decode("ascii")

class Transaction:
  def __init__(self, sender, receiver, value):
    self.sender = sender
    self.receiver = receiver
    self.value = value
    self.time = datetime.datetime.now()

  def to_dict(self):
    if self.sender == "Genesis":
      identity = "Genesis"
    else:
      identity = self.sender.identity
    return OrderedDict({
      "sender": identity,
      "receiver": self.receiver,  # Fix the attribute name
      "value": self.value,
      "time": self.time
    })

  def sign_transaction(self):
    private_key = self.sender._private_key
    signer = PKCS1_v1_5.new(private_key)
    h = SHA1.new(str(self.to_dict()).encode("utf8"))
    return binascii.hexlify(signer.sign(h)).decode("ascii")

def display_transaction(transaction):
  data = transaction.to_dict()
  print("sender", data["sender"])
  print("receiver", data["receiver"])
  print("value", data["value"])
  print("time", data["time"])
  print("\n")

Client1 = Client()
Client2 = Client()

# single transaction
x = Transaction(Client1, Client2.identity, "10")
x.sign_transaction()
display_transaction(x)

# receive input from user
receiver_name = input("Receiver name:")
amount = float(input("Amount to send:"))

y = Transaction(Client1, receiver_name, amount)
y.sign_transaction()
display_transaction(y)

# multiple transaction
transactions = ["Transaction 1", "Transaction 2", "Transaction 3"]

for transaction in transactions:
  t = Transaction(Client1, Client2.identity, transaction)
  t.sign_transaction()
  display_transaction(t)
