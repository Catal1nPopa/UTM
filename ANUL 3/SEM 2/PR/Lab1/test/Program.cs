using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Threading;

class Server
{
    public TcpListener serverSocket;
    public List<TcpClient> clients = new List<TcpClient>();

    public Server()
    {
        serverSocket = new TcpListener(IPAddress.Any, 9000);
        serverSocket.Start();

        Console.WriteLine("Serverul este pornit");
        while (true)
        {
            TcpClient client = serverSocket.AcceptTcpClient();
            
            clients.Add(client);

            Console.WriteLine("\n#########################################################################################\n");
            Console.WriteLine($"Client conectat: {((IPEndPoint)client.Client.RemoteEndPoint).Address}:{((IPEndPoint)client.Client.RemoteEndPoint).Port}");

            // Pornirea unui fir de execuție pentru a gestiona fiecare client în paralel
            Thread clientThread = new Thread(() => DataClient(client));
            clientThread.Start();
        }
    }
    public void DataClient(TcpClient client)
    {
        NetworkStream clientStream = client.GetStream();

        string welcomeMessage = "Te-ai conectat la server";
        byte[] welcomeMessageBytes = System.Text.Encoding.ASCII.GetBytes(welcomeMessage);
        clientStream.Write(welcomeMessageBytes, 0, welcomeMessageBytes.Length);

        byte[] buffer = new byte[1024];
        int bytesRead;

        Console.ForegroundColor = ConsoleColor.Yellow;
        while (true)
        {
            try
            {
                bytesRead = clientStream.Read(buffer, 0, buffer.Length);

                if (bytesRead == 0)
                {
                    Console.WriteLine("Clientul a transmis toate datele. Client Deconectat ", Console.ForegroundColor);
                    Console.WriteLine("\n#########################################################################################\n");
                    client.Close();
                    client.Dispose();
                    break;
                }

                string receivedData = System.Text.Encoding.ASCII.GetString(buffer, 0, bytesRead);
                Console.WriteLine($"Mesaj de la client: {receivedData}", Console.ForegroundColor);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Eroare: {ex.Message}");
                break;
            }
        }
    }
    public static void Main()
    {
        Server server = new Server();
    }
}