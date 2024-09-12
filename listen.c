#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>

#define BUFFER_SIZE 4096

void error(const char *msg) {
    perror(msg);
    exit(1);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <port>\n", argv[0]);
        exit(1);
    }

    int port = atoi(argv[1]);
    int server_fd, new_socket;
    struct sockaddr_in address;
    int addrlen = sizeof(address);
    char buffer[BUFFER_SIZE] = {0};
    char *body_start;

    // Create socket
    if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0) {
        error("socket failed");
    }

    // Configure address
    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY;
    address.sin_port = htons(port);

    // Bind the socket to the specified port
    if (bind(server_fd, (struct sockaddr *)&address, sizeof(address)) < 0) {
        error("bind failed");
    }

    // Listen for incoming connections
    if (listen(server_fd, 3) < 0) {
        error("listen failed");
    }

    // Accept a connection
    if ((new_socket = accept(server_fd, (struct sockaddr *)&address, (socklen_t*)&addrlen)) < 0) {
        error("accept failed");
    }

    // Read data from the connection
    int valread = read(new_socket, buffer, BUFFER_SIZE);
    if (valread < 0) {
        error("read failed");
    }

    // Find the start of the body (after the headers)
    body_start = strstr(buffer, "\r\n\r\n");
    if (body_start != NULL) {
        body_start += 4; // Skip the "\r\n\r\n"
        printf("%s", body_start);
    } else {
        perror("No body found.\n");
    }

    // Send HTTP 200 OK response
    const char *response = "HTTP/1.1 200 OK\r\nContent-Length: 0\r\n\r\n";
    send(new_socket, response, strlen(response), 0);

    // Close the connection
    close(new_socket);
    close(server_fd);

    return 0;
}
