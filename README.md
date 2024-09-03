Author: Sharath Pendyala

spendya@ncsu.edu

sharathpawan@gmail.com


Course:
ECE 592 - Cryptograhpic Engineering and Hardware Security at NC State University by Dr.Aydin Aysu


Assignment 1: AES-128 Implementataion with a given fixed secret key and expanded keys.Bonus: Decrypt function.


These set of matlab scripts can encrypt and decrypt a 128-bit plain_text/cipher_text (in hexadecimal) with a given fixed secret key and its expanded keys (as per assignment instruction).Secret Key is fixed to be: 0x000102030405060708090a0b0c0d0e0f


xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


>> Top Level Matlab Function File Location

Encrypt Function: /matlab/calculate_aes_128.m

Decrypt Function: /matlab/decrypt_aes_128.m


xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


>> Usage:

Encrypt Function:

	>> calculate_aes_128('00112233445566778899aabbccddeeff')

	ans =

    '69c4e0d86a7b0430d8cdb78070b4c55a'


Decrypt Function:

	>> decrypt_aes_128('69c4e0d86a7b0430d8cdb78070b4c55a')

	ans =

    '00112233445566778899aabbccddeeff'


Decrypt(Encrypt()):

	>> decrypt_aes_128(calculate_aes_128('00112233445566778899aabbccddeeff'))

	ans =

    '00112233445566778899aabbccddeeff'
