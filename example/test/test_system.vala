//valac main.vala --vapidir=../../ --pkg=csfml-graphics

using sf;

void main()
{
	Clock clock = new Clock();
	print ("Time: %f\n", clock.getElapsedTime().asSeconds());
	sf.Time.Seconds(1).sleep();
	print ("Time: %f\n", clock.getElapsedTime().asSeconds());
	print ("Time: %f\n", clock.getElapsedTime().asSeconds());
	sf.Time.Seconds(1).sleep();
	print ("Time: %f\n", clock.getElapsedTime().asSeconds());
	clock.restart();
	print ("Time: %f\n", clock.getElapsedTime().asSeconds());

}
