Feature: welcome to karate
  Scenario: how to print
    Given print "Hello World"
    When print "another print"
    Then print 'then print'


  Scenario: more printing
    Given  print 'some word'
    * print 'my name is','karate kid'

    # , --> concat two string
  * print 2+2


   Scenario: variables
     * def name = 'Mike'
     * print 'my name is', name
     * def age = 20
     * print name, 'is', age,'years old'

   Scenario: difficult parameters: json object
     * def student = {'name':'sam','owes_tuition':false}
     * print student
     * print student.name
     * print student.owes_tuition


   Scenario: json object 2
     * def student =
     """
     {
     "firstName":"Steven",
     "lastName":"King",
     "salary":2000
     }
     """
     * print student.salary
     * print student.firstName
     * print student.lastName


     Scenario: Spartan variable

       * def spartan =
       """
       {
    "id": 11,
    "name": "Lionel Cola",
    "gender": "Male",
    "phone": 1231232145
        }
       """

       * print spartan.name
       * print spartan.gender
       * print spartan.phone

    Scenario: json array objects

      * def students =

      """
      [

      {
      'name':'sam',
      'owes_tuition':false
      }

      {
      'name':'mike',
      'owes_tuition':true
      }
      ]
      """
      * print students
      * print students[0].name
      * print students[1].owes_tuition











