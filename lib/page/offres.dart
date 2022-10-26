import 'package:flutter/material.dart';
import 'package:mobile_app/page/offresDetails.dart';

class offres extends StatelessWidget {
  List img = [
    'images/3.png',
    'images/2.png',
    'images/1.png',
  ];

  List names = [
    'Developpeur Java',
    'Developpeur PHP',
    'Developpeur vue.js',
  ];

  List details = [
    'Description du poste Nous recherchons un Développeur Java disposant d’une bonne expérience dans le développement d’applications performantes, évolutives et professionnelles.Vous ferez partie d’une équipe logicielle talentueuse travaillant sur des applications stratégiques. Le Développeur Java sera, entre autres, chargé de gérer le développement d’applications Java/Java EE, tout en mettant son expertise à profit tout au long du cycle de développement de logiciels, de la conception et aux tests. Le Développeur Java notamment chargé de concevoir, développer et livrer des applications caractérisées par de grands volumes et une faible latence pour les systèmes stratégiques.Responsabilités Contribuer à toutes les phases du cycle de développement Rédiger du code efficace et bien conçu, testable Veiller à ce que les conceptions soient conformes aux spécifications -Élaborer et fournir de nouvelles versions de composants logiciels -Encourager l’amélioration continue par le biais de recherches sur les alternatives et les technologies, et en les soumettant à une analyse architecturale. *Exigences: -Licence ou master en informatique, en ingénierie ou une discipline connexe. -Expérience pratique confirmée en matière de développement de logiciels. -Expérience professionnelle confirmée du développement Java. -Expérience pratique dans la conception et le développement d’applications avec des plateformes Java et JEE. -Analyse et conception orientées objet avec des modèles de conception courants. -Connaissance approfondie des éléments internes des environnements Java et JEE internals (Classloading, gestion de mémoire, gestion des transactions, etc.) *Excellente connaissance des bases de données relationnelles, technologies SQL et ORM (JPA2, Hibernate). -Expérience dans les plateformes Spring Framework. -Expérience en tant que Développeur Java certifié Sun. -Expérience dans le développement d’applications Internet avec au moins un cadre web répandu (JSF, Wicket, GWT, Spring MVC). -Expérience dans le développement piloté par les tests (test-driven development)',
    'Après votre intégration au sein de notre entité à Sfax, vous serez amené à travailler dans l équipe de développement Web dans le cadre de nouveaux projets ou pour de la maintenance.Sous la responsabilité d un chef de projet, et conformément au processus de développement de SiFAST, vous aurez en charge : - la participation à la rédaction des spécifications fonctionnelles et techniques - le développement d applications Web et mobile - les tests et le support client - la rédaction de la documentation. *Profil: Vous êtes de formation ingénieur en informatique/Télécom, vous avez une expérience professionnelle de 3 ans en développement PHP/JavaScript. Qualités: Organisé et méthodique Autonome avec une bonne gestion du temps Sérieux et Responsable Sens du travail en équipe (partage, communication, respect d autrui Respect de la confidentialité Respect des processus client',
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    //var names;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: height * 0.3,
              width: width,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 7, 41, 236),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.account_circle,
                          color: Colors.white,
                          size: 30,
                        ),
                        Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Offres emploi',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Nunito',
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(100),
                      elevation: 8,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          hintText: 'Search',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          suffixIcon: Material(
                              borderRadius: BorderRadius.circular(100),
                              elevation: 8,
                              child: Icon(Icons.search)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.32,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text(
                        'IT',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.stars)
                    ],
                  ),
                ),
                Container(
                  height: height * 0.4,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: names.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FoodItemCard(
                        name: names[index],
                        description: details[index],
                        imgPath: img[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FoodItemCard extends StatefulWidget {
  final String name;
  final String description;
  final String imgPath;

  const FoodItemCard(
      {Key? key,
      required this.name,
      required this.description,
      required this.imgPath})
      : super(key: key);

  @override
  _FoodItemCardState createState() => _FoodItemCardState();
}

class _FoodItemCardState extends State<FoodItemCard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => offresDetails(
              name: widget.name,
              image: widget.imgPath,
              description: widget.description,
            ),
          ),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(15),
          elevation: 8,
          child: Container(
            height: height * 0.2,
            width: width * 0.5,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Stack(
              children: [
                /*Positioned(
                  right: 0,
                  left: 165,
                  top: 0,
                  child: Container(
                    height: 40,
                    width: 20,
                    decoration: BoxDecoration(
                       // color: Colors.red[900],
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(15))),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.add_shopping_cart,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),*/
                Positioned(
                  top: 80,
                  left: 20,
                  right: 10,
                  child: Hero(
                    tag: 'shadow${widget.imgPath}',
                    child: Image.asset(
                      widget.imgPath,
                      fit: BoxFit.cover,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Hero(
                        tag: 'image${widget.imgPath}',
                        child: Image.asset(
                          widget.imgPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Icon(Icons.subdirectory_arrow_left),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
