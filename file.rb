require 'json'
class Files

    def write_into_file(data , file_name )
        file= File.open(file_name , 'w')
    case file_name
      when 'book.json'
        file.write(JSON.generate(self.objects_to_hash_array(data,'book')))
      when  'people.json'
        file.write(JSON.generate(self.objects_to_hash_array(data,'people')))
      else
        file.write(JSON.generate(self.objects_to_hash_array(data,'rental')))
    end
   end

   def read_from_file(file_name)
     File.exist?(file_name) && !File.zero?(file_name) ? JSON.parse(File.read(file_name)) : []
   end

    def objects_to_hash_array(array_of_objects,object_type)
         case object_type
         when 'book'
          array_of_hashes=[]
          array_of_objects.each do |book|
            array_of_hashes.push({'id'=>book.id, 'title'=>book.title,'author'=>book.author})
          end
          return array_of_hashes
         when 'people'
          array_of_hashes=[]
          array_of_objects.each do |p|
            array_of_hashes << {'id'=>p.id, 'name'=>p.name,'age'=>p.age}
          end
          return array_of_hashes
          when 'rentals'
            array_of_hashes=[]
            array_of_objects.each do |r|
              array_of_hashes << {'book_id'=>r.book.id, 'person_id'=>r.person.id,'date'=>r.date}
            end
            return array_of_hashes
         else
          return []
         end 
    end

    def objects_from_array(array_of_hashes,object_type)
        case object_type
        when 'book'
         array_of_objects=[]
         array_of_hashes.each do |book|
           array_of_objects << Book.create_from_hash(book)
         end
         return array_of_objects
        when 'people'
          array_of_objects=[]
          array_of_hashes.each do |person|
            array_of_objects << Person.create_from_hash(person)
          end
          return array_of_objects
         when 'rentals'
          array_of_objects=[]
          array_of_hashes.each do |person|
            array_of_objects << Person.create_from_hash(person)
          end
          return array_of_objects
        else
         return []
        end 

      end
    
      def rentals_from_array(array_of_rentals, books, people)
        array_of_rentals.map do |hash|
          person = people.find do |p|
            p.id == hash['person_id']
          end
          puts hash['book_id']
          book = books.find do |b| 
            b.id == hash['book_id']
          end
          puts person, book
          Rental.new(hash['date'], person, book)
        end
      end
    
end