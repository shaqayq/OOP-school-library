require 'json'
class Files
   

    def write_into_file(data , file_name )
        file= File.open(file_name , 'w')
    case file_name
      when 'book.json'
        file.write(JSON.generate(self.objects_to_hash_array(data)))
      when  'people.json'
        file.write(JSON.generate(self.objects_to_hash_array(data)))
      else
        file.write(JSON.generate(self.objects_to_hash_array(data)))
    end
   end

   def read_from_file(file_name)
     File.exist?(file_name) ? JSON.parse(File.read(file_name)) : []
   end

    def objects_to_hash_array(array_of_objects)
        
        array_of_objects.map(&:to_hash)
    end

    def objects_from_array(array_of_hashes)
        array_of_hashes.map do |hash|
          class_name = hash['class']
          case class_name
          when 'Student'
            Student.create_from_hash(hash)
          when 'Teacher'
            Teacher.create_from_hash(hash)
          when 'Book'
            Book.create_from_hash(hash)
          end
        end
      end
    
      def rentals_from_array(array_of_rentals, books, people)
        array_of_rentals.map do |hash|
          person = people.find do |p|
            puts "#{p.id} is #{hash['person_id']} "
            p.id == hash['person_id']
          end
          book = books.find { |b| b.id == hash['book_id'] }
          puts person, book
          Rental.new(hash['date'], person, book)
        end
      end
    
end