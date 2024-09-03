# Advanced Encryption Standard (AES-128) in Matlab
![aes_lock_and_key](https://github.com/sharathpend/ECE592_Assignment1/blob/main/readme_images/aes.avif)

# Links
* [NIST FIPS 197 - AES](https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.197-upd1.pdf)
* [Wikipedia - AES](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard)


# Background
The Advanced Encryption Standard (AES), also known by its original name Rijndael (Dutch pronunciation: [ˈrɛindaːl]), is a specification for the encryption of electronic data established by the U.S. National Institute of Standards and Technology (NIST) in 2001.

AES is a variant of the Rijndael block cipher developed by two Belgian cryptographers, Joan Daemen and Vincent Rijmen, who submitted a proposal to NIST during the AES selection process. Rijndael is a family of ciphers with different key and block sizes. For AES, NIST selected three members of the Rijndael family, each with a block size of 128 bits, but three different key lengths: 128, 192 and 256 bits.

AES has been adopted by the U.S. government. It supersedes the Data Encryption Standard (DES), which was published in 1977. The algorithm described by AES is a symmetric-key algorithm, meaning the same key is used for both encrypting and decrypting the data.

In the United States, AES was announced by the NIST as U.S. FIPS PUB 197 (FIPS 197) on November 26, 2001. This announcement followed a five-year standardization process in which fifteen competing designs were presented and evaluated, before the Rijndael cipher was selected as the most suitable.

AES is included in the ISO/IEC 18033-3 standard. AES became effective as a U.S. federal government standard on May 26, 2002, after approval by U.S. Secretary of Commerce Donald Evans. AES is available in many different encryption packages, and is the first (and only) publicly accessible cipher approved by the U.S. National Security Agency (NSA) for top secret information when used in an NSA approved cryptographic module.


# Contributor(s)
Author: Sharath Pendyala

Contact: spendya@ncsu.edu sharathpawan@gmail.com

Website: W.I.P.


# Course:
ECE 592 - Cryptograhpic Engineering and Hardware Security at NC State University by Dr.Aydin Aysu


Assignment 1: AES-128 Implementataion with a given fixed secret key and expanded keys. Bonus: Implement a Decrypt function. Problem Statement in /problem_statement/ directory


These set of matlab scripts can encrypt and decrypt a 128-bit plain_text/cipher_text (in hexadecimal) with a given fixed secret key and its expanded keys (as per assignment instruction). Secret Key is fixed to be: 0x000102030405060708090a0b0c0d0e0f


# Top Level Matlab Function File Location

Encrypt Function: /matlab/calculate_aes_128.m

Decrypt Function: /matlab/decrypt_aes_128.m


# Usage:

##Encrypt Function:

	>> calculate_aes_128('00112233445566778899aabbccddeeff')

	ans =

    '69c4e0d86a7b0430d8cdb78070b4c55a'


##Decrypt Function:

	>> decrypt_aes_128('69c4e0d86a7b0430d8cdb78070b4c55a')

	ans =

    '00112233445566778899aabbccddeeff'


##Decrypt(Encrypt()): Example 1

	>> decrypt_aes_128(calculate_aes_128('00112233445566778899aabbccddeeff'))

	ans =

    '00112233445566778899aabbccddeeff'
	

##Decrypt(Encrypt()): Example 2

	>> decrypt_aes_128(calculate_aes_128('000102030405060708090a0b0c0d0e0f'))

	ans =

    '000102030405060708090a0b0c0d0e0f'


# Screenshots:

Tested on Matlab R2023b.

## Encrypt and Decrypt Function without Debug
![enc_and_dec_no_debug](https://github.com/sharathpend/ECE592_Assignment1/blob/main/results/encrypt_and_decrypt_functions_in_matlab_without_debug.png)

## Encrypt with Intermediate Calculations - Part 1 of 3
![enc_debug_001](https://github.com/sharathpend/ECE592_Assignment1/blob/main/results/encrypt_function_in_matlab_with_debug_001.png)

## Encrypt with Intermediate Calculations - Part 2 of 3
![enc_debug_002](https://github.com/sharathpend/ECE592_Assignment1/blob/main/results/encrypt_function_in_matlab_with_debug_002.png)

## Encrypt with Intermediate Calculations - Part 3 of 3
![enc_debug_003](https://github.com/sharathpend/ECE592_Assignment1/blob/main/results/encrypt_function_in_matlab_with_debug_003.png)

## Decrypt with Intermediate Calculations - Part 1 of 3
![dec_debug_001](https://github.com/sharathpend/ECE592_Assignment1/blob/main/results/decrypt_function_in_matlab_with_debug_001.png)

## Decrypt with Intermediate Calculations - Part 2 of 3
![dec_debug_002](https://github.com/sharathpend/ECE592_Assignment1/blob/main/results/decrypt_function_in_matlab_with_debug_002.png)

## Decrypt with Intermediate Calculations - Part 3 of 3
![dec_debug_003](https://github.com/sharathpend/ECE592_Assignment1/blob/main/results/decrypt_function_in_matlab_with_debug_003.png)
