pragma solidity ^0.6.0;
// SPDX-License-Identifier: MIT

// Este es un contrato inteligente de arrendamiento que permite al titular del bien inmueble el alquilar por un período de tiempo determinado y una renta acordada. El cumplimiento puede ser interno y externo (por criptomonedas).

//Actio1680

contract ContratoArrendamiento1 {

  address payable public arrendador;  // Dirección del titular del bien inmueble
  address public arrendatario; // Dirección del inquilino
  uint public rentcost; // Precio de la renta en Wei, la renta es mensual
  string public ubicacion; // Dirección del bien inmueble arrendado
  uint public fechainicio; // Almacena la fecha de inicio del alquiler día-mes-año
  uint public fechafin;  // Almacena la duración del alquiler en meses

  // Constructor que inicializa el contrato y establece el propietario y el inquilino
    constructor( address payable _arrendador, address _arrendatario, uint _rentcost, 
    string memory _ubicacion, uint _fechainicio, uint _fechafin) public {
    arrendador = _arrendador;
    arrendatario = _arrendatario;
    rentcost = _rentcost;
    ubicacion = _ubicacion;
    fechainicio = _fechainicio; // fecha de inicio 01-01-2023:  1674190800
    fechafin = _fechafin;
  }

 // Permite al titular del bien inmueble establecer la renta y la fecha fin del alquiler
  function terminosArrendamiento(uint _rentcost, uint _fechafin) public {
    require(arrendador == msg.sender, "Solo el arrendador puede establecer los terminos del alquiler.");
    rentcost = _rentcost;
    fechafin = _fechafin;
  }

  // Permite al titular del bien inmueble recibir la renta del alquiler
  function payRent() public payable {
    require(msg.value == rentcost, "El monto de la renta debe ser igual al precio del alquiler.");
    require(msg.sender == arrendatario, "Solo el arrendatario puede realizar la renta del alquiler.");
    arrendador.transfer(msg.value);
  }

  // Permite al titular del bien inmueble finalizar el alquiler antes del término acordado
  function endLease() public {
    require(arrendador == msg.sender, "Solo el propietario puede finalizar el alquiler.");
    arrendatario = address(0);
  }

  // Permite comparar la fecha de inicio del contrato con la fecha actual para verificar si el contrato ha expirado
  function hasExpired() public view returns (bool) {
  uint currentDate = now;
  return currentDate >= fechafin;
  }
}
