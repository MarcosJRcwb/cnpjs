import queue
import threading
import time
from typing import Iterator,Optional

class FilaDeLinhas:
  
  def __init__(self):
    self._fila = queue.Queue()
    self._tamanho = 0
    self.Acabou = False

  def AdicionaLinha(self,linha):
    self._fila.put(linha)
    self._tamanho = self._tamanho+1

  def read(self, n: Optional[int] = None) -> str:
    while not (self.Acabou and self._fila.empty()):
      if self._fila.empty():
        time.sleep(0.1)
        continue
      self._tamanho = self._tamanho-1
      return self._fila.get()
    return ''

  def Count(self) -> str:
    return str(self._tamanho)