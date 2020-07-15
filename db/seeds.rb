# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!([
    { name: 'damien',
      email: 'damien@server.io',
      password: 'abcd',
    },
    { name: 'natasha',
      email: 'nat@server.io',
      password: 'abcd',
    }
])

Group.create!([
    { name: 'tech',
      icon: ''
    },
    { name: 'programing',
      icon: ''
    },
    { name: 'movies',
      icon: ''
    },
    { name: 'animes',
      icon: ''
    },
    { name: 'sport',
      icon: ''
    },
    { name: 'mangas',
      icon: ''
    },
    { name: 'food',
      icon: ''
    },
    { name: 'health',
      icon: ''
    },
    { name: 'business',
      icon: ''
    } 
])

Program.create!([
    { name: 'CS50 introduction to programing',
      amount: 100,
      author_id: 1,
      group_id: 2
    },
    { name: 'CS50 introduction to programing',
      amount: 100,
      author_id: 1,
      group_id: 2
    },
    { name: 'CS50 introduction to programing',
      amount: 100,
      author_id: 1,
      group_id: 2
    },
    { name: 'CS50 introduction to programing',
      amount: 100,
      author_id: 1,
      group_id: 2
    },
    { name: 'CS50 introduction to programing',
      amount: 100,
      author_id: 1,
      group_id: 2
    },
    { name: 'CS50 introduction to programing',
      amount: 100,
      author_id: 1,
      group_id: 2
    },
    { name: 'CS50 introduction to programing',
      amount: 100,
      author_id: 1,
      group_id: 2
    },
    { name: 'CS50 introduction to programing',
      amount: 100,
      author_id: 1,
      group_id: 2
    },
    { name: 'CS50 introduction to programing',
      amount: 100,
      author_id: 1,
      group_id: 2
    },
    { name: 'CS50 introduction to programing',
      amount: 100,
      author_id: 1,
      group_id: 2
    },
    { name: 'CS50 introduction to programing',
      amount: 100,
      author_id: 1,
      group_id: 2
    },
    { name: 'CS50 introduction to programing',
      amount: 100,
      author_id: 1,
      group_id: 2
    },
    { name: 'CS50 introduction to programing',
      amount: 100,
      author_id: 1,
      group_id: 2
    },
    { name: 'CS50 introduction to programing',
      amount: 100,
      author_id: 1,
      group_id: 2
    },
    { name: 'CS50 introduction to programing',
      amount: 100,
      author_id: 1,
      group_id: 2
    },
    { name: 'CS50 introduction to programing',
      amount: 100,
      author_id: 1,
      group_id: 2
    },
    { name: 'CS50 introduction to programing',
      amount: 100,
      author_id: 1,
      group_id: 2
    },
    { name: 'CS50 introduction to programing',
      amount: 100,
      author_id: 1,
      group_id: 2
    }
])