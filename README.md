# **Implementación de la ALU (Unidad Aritmética Lógica)**

Este repositorio contiene una implementación de una Unidad Aritmética Lógica (ALU) de 32 bits en Verilog. La ALU puede realizar operaciones aritméticas y lógicas básicas, y proporciona banderas de estado para indicar el resultado de estas operaciones.

## **Funcionalidad**

La ALU realiza las siguientes operaciones basadas en la entrada `ALUControl`:

- `00`: Suma
- `01`: Resta
- `10`: AND lógico
- `11`: OR lógico

## **Flags**

La ALU también genera loss siguientes flags:

- **N (Negative)**: Indica si el resultado es negativo.
- **Z (Zero)**: Indica si el resultado es cero.
- **C (Carry)**: Indica si hay un acarreo en la operación de suma/resta.
- **V (Overflow)**: Indica si hay un desbordamiento aritmético.

## **Cómo Ejecutar**

Ejemplo usando Icarus Verilog:

```sh
iverilog -o alu_tb alu_tb.v alu.v
vvp alu_tb
```
