import java.util.Scanner;
public class battleship{
	public static void main(String[] args) {
	Scanner sc = new Scanner(System.in);

/* 	analyza
 *
 *  	- zavest hrace (testovaci hraci)
 *  	- vystrel hrace 1 (vcetne kontroly souradnic bylo vystreleno)
 *	- check vysledku (porovnani vystrelu s player2)
 * 	- zapis na player2
 *	- zobrazeni (zapis) na targets1
 *	- check konce
 *  	- vystrel hrace 2 (vcetne kontroly souradnic)
 *  	- check vysledku (porovnani vystrelu s player1)
 *  	- zobrazeni (zapis) na targets2
 *  	- check konce
 *	- opakovani
 */

	System.out.println("Welcome to Battleship!");

//	zavedeni hracu

	System.out.println("Player 1, enter your ships' coordinates.");

int num = 1; //globalni promenna cislo hrace

	char[][] player1 = new char[5][5];
	for (int myi = 0; myi < 5;myi++){
		for (int j = 0; j < 5; j++)
		{player1[myi][j] = '-';}}
	
	for (int i = 1; i<6;i++){
	
	System.out.println("Enter ship "+i+" location: ");
	int b = sc.nextInt();
	int c = sc.nextInt();
	
	while (b>4 || b < 0) {
	System.out.println("Invalid coordinate. Choose different coordinates.");	
	b = sc.nextInt();
	c = sc.nextInt();
	
	
	}

	while (player1[b][c]=='@') {
		System.out.println("You already have a ship there. Choose different coordinates.");
		b = sc.nextInt();
		c = sc.nextInt();
	}
	player1[b][c] = '@';	


	}

	System.out.println("Player 2, enter your ships' coordinates.");

	char[][] player2 = new char[5][5];
	for (int myi = 0; myi < 5;myi++){
		for (int j = 0; j < 5; j++)
		{player2[myi][j] = '-';}}
	for (int i = 1; i<6;i++){
		
	System.out.println("Enter ship "+i+" location: ");
	int b = sc.nextInt();
	int c = sc.nextInt();

	while (b>4 || b < 0) {
	System.out.println("Invalid coordinate. Choose different coordinates.");	
	b = sc.nextInt();
	c = sc.nextInt();
	
	
	}

	while (player2[b][c]=='@') {
		System.out.println("You already have a ship there. Choose different coordinates.");
		b = sc.nextInt();
		c = sc.nextInt();
	}
	player2[b][c] = '@';	
		
	}


/*
//	testovaci hraci

	char[][] player1 = new char[5][5];
	for (int myi = 0; myi < 5;myi++){
		for (int j = 0; j < 5; j++)
		{player1[myi][j] = '-';}}
	player1[4][4]='@';	
	player1[0][4]='@';	
	player1[1][4]='@';	
	player1[0][3]='@';	
	player1[1][3]='@';	

	char[][] player2 = new char[5][5];
	for (int myi = 0; myi < 5;myi++){
		for (int j = 0; j < 5; j++)
		{player2[myi][j] = '-';}}
	player2[3][4]='@';	
	player2[0][2]='@';	
	player2[1][2]='@';	
	player2[0][0]='@';	
	player2[1][3]='@';	
*/
// target History board
	char[][] player1Target = new char[5][5];
	char[][] player2Target = new char[5][5];

	for (int myi = 0; myi < 5;myi++){
		for (int j = 0; j < 5; j++)
		{player1Target[myi][j] = '-';
		player2Target[myi][j] = '-';
		}}

//zobrazeni bordu

	printBattleShip(player1);
	printBattleShip(player2);
	
//vystrel
	boolean konec = false;
	while (konec == false){


	while (konec == false) {
		num = 1;


	System.out.println("Player "+num+".");
	System.out.print("Enter coordinate to fire: ");

	int b = sc.nextInt();
	int c = sc.nextInt();
	do {
	while ((b>4 || b < 0) && (c>4 || c<0)) {
	System.out.println("Invalid coordinate. Choose different coordinates.");	
	b = sc.nextInt();
	c = sc.nextInt();
	}
	while (player2[b][c]=='X' || player2[b][c]=='O'){
	System.out.println("You already fired on this spot. Choose different coordinates");	
	b = sc.nextInt();
	c = sc.nextInt();
	}
	break;
	}
	while (true);

// 	test vystrelu

	if (player2[b][c]=='@'){
	System.out.println("Player "+num+" hit player"+(num+1)+"'s ship!");
	player2[b][c] = 'X';
	player2Target[b][c] = 'X';
	if (testKonec(player2)) {
		konec = true;
		break;
	}
	}
	else {	
	System.out.println("Player "+num+" missed!");
	player2[b][c] = 'O';
	player2Target[b][c] = 'O';
	}
	
	//printBattleShip(player2);
	printBattleShip(player2Target);
	break;
	}
	// hrac2

	while (konec == false) {
	num = 2;


	System.out.println("Player "+num+".");
	System.out.print("Enter coordinate to fire: ");

	int b = sc.nextInt();
	int c = sc.nextInt();
	do {
	while ((b>4 || b < 0) && (c>4 || c<0)) {
	System.out.println("Invalid coordinate. Choose different coordinates.");	
	b = sc.nextInt();
	c = sc.nextInt();
	}
	while (player1[b][c]=='X' || player1[b][c]=='O'){
	System.out.println("You already fired on this spot. Choose different coordinates");	

	b = sc.nextInt();
	c = sc.nextInt();
	}
	break;
	}
	while (true);

// 	test vystrelu

	if (player1[b][c]=='@'){
	System.out.println("Player "+num+" hit player"+(num-1)+"'s ship!");
	player1[b][c] = 'X';
	player1Target[b][c] = 'X';
	if (testKonec(player1))
	{
		konec = true;
		break;
	}
	}
	else {	
	System.out.println("Player "+num+" missed!");
	player1[b][c] = 'O';
	player1Target[b][c] = 'O';
	}
	
	//printBattleShip(player2);
	printBattleShip(player1Target);
	break;
	}
	}





	System.out.println("Player "+num+" has won.");
	System.out.println("Final boards:");

	printBattleShip(player1);
	printBattleShip(player2);


//		play(playerTest, 1);
//		hit(playerTest, 4, 4, 2);
//		System.out.println(testMine(playerTest)+"Test");




/*	boolean num = true;
	play(player2);
*/
	
	}

private static void printBattleShip(char[][] player) {
		System.out.print("  ");
		for (int row = -1; row < 5; row++) {
			if (row > -1) {
				System.out.print(row + " ");
			}
			for (int column = 0; column < 5; column++) {
				if (row == -1) {
					System.out.print(column + " ");
				} else {
					System.out.print(player[row][column] + " ");
				}
			}
			System.out.println("");
		}
	}

	

	
private static boolean testKonec (char[][] player) {
	for (int i = 0; i < 5;i++){
		for (int j = 0; j< 5;j++){
			if (player[i][j] == '@'){
				return false;
			}
		}
	}
			return true;


		}
	
	
	
	
	}	 
