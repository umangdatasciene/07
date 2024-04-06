# pip install crypto
# pip install pycryptodome

from Crypto.PublicKey import RSA
import time

start_time = time.time()
key = RSA.generate(1024)  # length of bit 1024/2048 and so on
public_key = key.public_key().export_key("PEM")
private_key = key.export_key("PEM")

print(public_key)
print(private_key)
end_time = time.time()
total_time = end_time - start_time
print(total_time)