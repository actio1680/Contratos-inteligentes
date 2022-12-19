pragma solidity ^0.6.0;
// SPDX-License-Identifier: MIT

// Este es un contrato inteligente que permite mostrar un nombre y edad, así como 
// la modificación de dicha edad. El contrato es útil para realizar las primeras 
// pruebas en el mundo de los smart contracts. 

// Actio1680


// Contrato principal
contract ContratoEdad {
  // Variables
  string public nombre;
  uint public edad;

  // Constructor para inicializar el contrato
  constructor(string memory _nombre, uint _edad) public {
    nombre = _nombre;
    edad = _edad;
  }

  // Función para actualizar la edad
  function actualizarEdad(uint _edad) public {
    edad = _edad;
  }

  // Función para obtener la edad
  function obtenerEdad() public view returns (uint) {
    return edad;
  }
}
