from locust import HttpLocust, TaskSet, task

class WebsiteTasks(TaskSet):
    @task
    def status(self):
        self.client.get("/status")
        
class WebsiteUser(HttpLocust):
    task_set = WebsiteTasks
    min_wait = 5000
    max_wait = 15000
    host = 'http://localhost:4567'
