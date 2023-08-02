package com.mycompany.gameahorcado;

import java.util.Scanner;

public class GameAhorcado {

    public static void main(String[] args) {


        Scanner scanner = new Scanner(System.in);
        boolean seguirJugando = true;

        while (seguirJugando) {
            jugarAhorcado();
            System.out.print("¿Quieres seguir jugando? (s/n): ");
            char respuesta = scanner.next().charAt(0);
            seguirJugando = (respuesta == 's' || respuesta == 'S');
        }

        scanner.close();
        System.out.println("Gracias por jugar al Ahorcado. ¡Hasta pronto!");
    }

    public static void jugarAhorcado() {
        String[] palabras = { "ordenador", "programacion", "java", "codigo", "informatica", "desarrollo" };
        String palabraAdivinar = palabras[(int) (Math.random() * palabras.length)];

        int intentosMaximos = 6;
        int intentosRealizados = 0;
        char[] letrasAdivinadas = new char[palabraAdivinar.length()];

        // Inicializar el array de letras adivinadas con guiones bajos.
        for (int i = 0; i < letrasAdivinadas.length; i++) {
            letrasAdivinadas[i] = '_';
        }

        boolean adivinado = false;
        Scanner scanner = new Scanner(System.in);

        while (!adivinado && intentosRealizados < intentosMaximos) {
            System.out.println("Palabra a adivinar: " + String.valueOf(letrasAdivinadas));
            System.out.println("Intentos restantes: " + (intentosMaximos - intentosRealizados));
            System.out.print("Ingresa una letra: ");
            char letra = scanner.next().charAt(0);

            boolean letraAdivinada = false;
            for (int i = 0; i < palabraAdivinar.length(); i++) {
                if (palabraAdivinar.charAt(i) == letra) {
                    letrasAdivinadas[i] = letra;
                    letraAdivinada = true;
                }
            }

            if (!letraAdivinada) {
                intentosRealizados++;
                System.out.println("La letra no está en la palabra.");
            }

            adivinado = palabraAdivinar.equals(String.valueOf(letrasAdivinadas));
            System.out.println();
        }

        if (adivinado) {
            System.out.println("¡Felicidades! Has adivinado la palabra: " + palabraAdivinar);
        } else {
            System.out.println("Lo siento, has agotado todos tus intentos. La palabra era: " + palabraAdivinar);
        }
    }
}


