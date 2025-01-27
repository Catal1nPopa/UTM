#include <iostream>
#include <cstdlib>
#include <ctime>

int main() {
    srand(time(NULL));
    int secretNumber = rand() % 100; // generates a random number between 0 and 99
    int guess;

    std::cout << "Welcome to the guessing game! Guess a number between 0 and 99: ";
    while (std::cin >> guess) {
        if (guess == secretNumber) {
            std::cout << "Congratulations! You guessed the secret number!" << std::endl;
            break;
        } else if (guess < secretNumber) {
            std::cout << "Too low! Guess again: ";
        } else {
            std::cout << "Too high! Guess again: ";
        }
    }
    return 0;
}
