<#import "parts/common.ftlh" as c>

<@c.page>

    <div class="form-row">
        <div class="form-group col-mb-6">
            <form method="get" action="/main" class="form-inline">
                <input type="text" class="form-control" name="filter" value="${filter!}" placeholder="Search by tag">
                <button type="submit" class="btn btn-primary ml-2">Найти</button>
            </form>
        </div>
    </div>

    <a class="btn btn-primary" data-toggle="collapse" href="#message" role="button" aria-expanded="false" aria-controls="collapseExample">
        Добавить новое сообщение
    </a>
    <div class="collapse <#if message??>show</#if>" id="message">
        <div class="form-group mt-3">
            <form method="post" action="/add" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                           value="<#if message??>${message.text}</#if>" name="text" placeholder="Введите сообщение" />
                    <#if textError??>
                        <div class="invalid-feedback">
                            ${textError}
                        </div>
                    </#if>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control ${(tagError??)?string('is-invalid', '')}"
                           value="<#if message??>${message.tag}</#if>" name="tag" placeholder="Тэг">
                    <#if tagError??>
                        <div class="invalid-feedback">
                            ${tagError}
                        </div>
                    </#if>
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" class="form-control" name="file" id="customFile">
                        <label class="custom-file-label" for="customFile">Choice file</label>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Добавить</button>
                </div>
            </form>
        </div>
    </div>

    <#include "parts/messageEdit.ftlh" />
    <#include "parts/messagesList.ftlh" />
</@c.page>