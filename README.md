# README

Задумка состоит в том, чтобы была возможность добавлять преподавателя сразу со всеми предметами
которые он ведет (Например: Алгебра, Геометрия).

Поэтому необходимо сделать сразу несколько полей для возможного ввода
Проблема состоит в том, что полученная форма передает данные в strong parameters не правильно

Модели Lesson и Teacher имеют отношение many to many и работают через связанную таблицу

Метод контроллера: 
  
  def teacher
    @teachers = Teacher.all
    @new_teacher = Teacher.new
    @lessons = Lesson.all #.map { |subj| [subj.name, subj.id] }
    respond_to do |format|
      format.js
      format.html
    end
  end

View:
  <div class='col-4 offset-2'>
    <h3>Добавить преподавателя</h3>
    <%= form_with model: @new_teacher, url: admin_add_teacher_path, method: 'post' do |f| %>

      <div class='row' id='FIO'>
        <%= f.label :FIO, 'Фамилия И.О.' %>
        <%= f.text_field :FIO, class: 'col-8' %>
      </div>

      <% 4.times do |ind| %>
        <div class='row' id='l<%= ind + 1 %>'>
          <%= f.label :lesson, "Предмет #{ind + 1}" %>
          <div class='col-8 select'>
            <%= f.fields_for :lesson do |lesson_fields| %>
              <%= lesson_fields.collection_select :id, @lessons, :id, :name, include_blank: true %>
            <% end %>
          </div>
          <%= f.submit '+', class: 'col-1 offset-1 plus', id: "s#{ind + 1}", type: :button %>
        </div>
      <% end %>

      <div class='row col-3' style='margin: 10px'>
        <%= f.submit 'Добавить', id: "add" %>
      </div>

    <% end %>
  </div>