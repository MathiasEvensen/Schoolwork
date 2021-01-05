#include <iostream>
#include <string>
#include <windows.h>

using namespace std;

static string host;
static string ping_again;

void ping()
{
    system("cls");
    cout << "Host: \t";
    cin >> host;
    system (("ping " + host).c_str());
    cout << endl;
    cout << "(Y)es or (N)o\n\n";
    cout << "Ping another host: ";
    cin >> ping_again;
    if (ping_again == "Y" || ping_again == "y")
    {
        system("cls");
        ping();
    }
    else if (ping_again == "N" || ping_again == "n")
    {
        system("exit");
    }
}

int main()
{
    SetConsoleTitle("Ping");
    ping();

    return(0);
}