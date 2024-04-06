import hashlib

def sha256(message):
  return hashlib.sha256(message.encode('ascii')).hexdigest()

def mine(message, difficulty = 1):
  assert difficulty >= 1
  prefix = '1' * difficulty
  print("prefix", prefix)

  for i in range(1000):
    digest = sha256(str(hash(message)) + str(i))
    print("Testing digest: " + digest)
    if(digest.startswith(prefix)):
      print("\nNounce found after " + str(i) + " iterations:\n" + digest)
      return 1

mine("Hello World!", 2)