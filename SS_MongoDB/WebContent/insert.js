db.bios.insert(
   {
     _id: 1,   //如不指定_id列,系统会自动生成一个ObjectId 
     name: { first: 'John', last: 'Backus' },
     birth: new Date('Dec 03, 1924'),
     contribs: [ 'Fortran', 'ALGOL', 'Backus-Naur Form', 'FP' ],
     awards: [
               {
                 award: 'W.W. McDowell Award',
                 year: 1967,
                 by: 'IEEE Computer Society'
               },
               {
                 award: 'National Medal of Science',
                 year: 1975,
                 by: 'National Science Foundation'
               }
             ]
   },
    {
       _id: 4,
       name: { first: 'Kristen', last: 'Nygaard' },
       birth: new Date('Aug 27, 1926'),
       death: new Date('Aug 10, 2002'),
       contribs: [ 'OOP', 'Simula' ],
       awards: [
                 {
                   award: 'Rosing Prize',
                   year: 1999,
                   by: 'Norwegian Data Association'
                 },
                 {
                   award: 'Turing Award',
                   year: 2001,
                   by: 'ACM'
                 },
                 {
                   award: 'IEEE John von Neumann Medal',
                   year: 2001,
                   by: 'IEEE'
                 }
               ]
     }
)





for (var i = 1; i <= 25; i++) db.testData.insert( { x : i } )




function insertData(dbName, colName, num) {  //就是JavaScript

  var col = db.getSiblingDB(dbName).getCollection(colName);

  for (i = 0; i < num; i++) {
    col.insert({x:i});
  }

  print(col.count());

}

insertData("test", "testData", 400)














