// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;

contract ZombieFactory {
    // イベントをここで宣言するのだ

    uint256 dnaDigits = 16;
    uint256 dnaModulus = 10**dnaDigits;

    struct Zombie {
        string name;
        uint256 dna;
    }

    Zombie[] public zombies;

    function _createZombie(string memory _name, uint256 _dna) private {
        zombies.push(Zombie(_name, _dna));
        // ここでイベントを発生させるのだ
    }

    function _generateRandomDna(string memory _str)
        private
        view
        returns (uint256)
    {
        uint256 rand = uint256(keccak256(bytes(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
        uint256 randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }
}

// https://note.com/standenglish/n/nb734745cfb86
